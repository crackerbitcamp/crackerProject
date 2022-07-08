package spring.conf;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:db.properties")
public class SpringConfiguration {
	@Value("${jdbc.driver}")
	private String driver;
	@Value("${jdbc.url}")
	private String url;
	@Value("${jdbc.username}")
	private String username;
	@Value("${jdbc.password}")
	private String password;

	@Autowired
	private ApplicationContext context;

	@Bean(name = "dataSource")
	public BasicDataSource getDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(driver);
		dataSource.setUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		return dataSource;
	}

//	
	@Bean(name = "sqlSessionFactory")
	public SqlSessionFactory getSqlSessionFactory() throws Exception {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setConfigLocation(new ClassPathResource("mybatis-config.xml"));
		bean.setDataSource(getDataSource());

		// 1번째 방법
		// bean.setMapperLocations(new ClassPathResource("/mapper/memberMapper.xml"));

		// 2번째 방법
//		bean.setMapperLocations(
//				new ClassPathResource("mapper/memberMapper.xml"),
//				new ClassPathResource("mapper/productMapper.xml")
//		);

		bean.setMapperLocations(context.getResources("classpath:mapper/*Mapper.xml"));

		return bean.getObject(); // SqlSessionFactory 를 반환해줌
	}

	@Bean(name = "sqlSession")
	public SqlSessionTemplate getSqlSession() throws Exception {
		SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(getSqlSessionFactory());
		return sqlSessionTemplate;
	}

	@Bean(name = "transactionManager")
	public DataSourceTransactionManager getTransactionManager() {
		DataSourceTransactionManager tm = new DataSourceTransactionManager(getDataSource());
		return tm;
	}
}
