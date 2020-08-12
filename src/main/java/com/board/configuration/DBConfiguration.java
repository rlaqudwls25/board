package com.board.configuration;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration

/** 해당 클래스에 참조할 properites 파일의 위치를 조정 */
@PropertySource("classpath:/application.properties")
public class DBConfiguration {

    @Autowired
    private ApplicationContext applicationContext;

    @Bean
    /** prefix에 해당하는 spring.datasource.hikari로 시작하는 설정을
     * 모두 읽어 들여 해당 메서드에 매핑(바인딩)
     */
    @ConfigurationProperties(prefix = "spring.datasource.hikari")
    public HikariConfig hikariConfig() {
        return new HikariConfig();
    }

    @Bean
    /**
     * 데이터 소스 객체 생성
     * 데이터 소스 = 커넥션풀 지원하기 위한 인터페이스
     */
    public DataSource dataSource() {
        return new HikariDataSource(hikariConfig());
    }

    @Bean
    /**
     * SqlSessionFactory 객체 생성
     */
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        /**
         * SqlSessionFactoryBean = 마이바티스와 스프링의 연동 모듈
         */
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource());
        factoryBean.setMapperLocations(applicationContext.getResources("classpath:/mappers/*" +
                "" +
                "Mapper.xml"));
        factoryBean.setTypeAliasesPackage("com.board.domain");
        factoryBean.setConfiguration(mybatisConfg());
        return factoryBean.getObject();
    }

    /**
     * SqlSessionTemplate은 SqlSessionFactory를 통해 생성
     * SQL 실행에 필요한 모든 메서드를 갖는 객체
     * @return
     * @throws Exception
     */
    @Bean
    public SqlSessionTemplate sqlSession() throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory());
    }

    @Bean
    @ConfigurationProperties(prefix = "mybatis.configuration")
    public org.apache.ibatis.session.Configuration mybatisConfg() {
        return new org.apache.ibatis.session.Configuration();
    }


}