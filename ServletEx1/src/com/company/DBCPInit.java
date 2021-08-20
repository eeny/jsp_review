package com.company;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

// p418
public class DBCPInit extends HttpServlet {
// 이 클래스는 커넥션 풀 만들어서 커넥션을 미리 만들어 담아두는 역할이다.
// 이 클래스가 문제 없이 돌아간다면 더이상 conn을 그때 그때 생성하지 않아도 된다!
	
	@Override
	public void init() throws ServletException {
		// 서버가 실행되면 자동으로 초기화 시켜주기 위해서 호출된다!
		loadJDBCDriver();
		initConnectionPool();
	}
	
	private void loadJDBCDriver() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("after connection.....");
	}
	
	private void initConnectionPool() {
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
			String username = "root";
			String password = "1234";
			
			// ConnectionFactory 생성
			// 클래스명에 Factory가 들어가면 공장처럼 찍어낸다! 자동으로 생성된다!
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcUrl, username, password);
			
			// PoolableConnection을 생성하는 Factory 생성
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			// DBCP는 커넥션풀에 커넥션을 보관할 때 PoolableConnection을 사용한다.
			// 이 클래스는 내부적으로 실제 커넥션을 담고 있으며, 커넥션풀을 관리하는데 필요한 기능을 제공한다.
			// ex) close() 메서드를 실행하면 실제로 메모리에서 날리는 게 아니고, pool로 반환한다!
			
			// 문제없는지 테스트하는 코드
			poolableConnFactory.setValidationQuery("select 1");
			
			// 커넥션 풀의 설정 정보
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			// 유휴 커넥션 검사 주기
			poolConfig.setTestWhileIdle(true);
			//풀에 보관 중인 커넥션이 유효한지 검사할 지 여부
			poolConfig.setMinIdle(4);
			// 시작했을 때 만들어놓을 최소 커넥션 개수
			poolConfig.setMaxTotal(50);
			// 전체 접속 가능 개수
			
			// 커넥션 풀 생성 및 연결
			GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);
			
			// 커넥션 풀을 제공하는 JDBC 드라이버를 등록
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			
			// 커넥션 풀 드라이버에 생성한 커넥션 풀을 등록
			PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool("conname", connectionPool);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
}// Class end











