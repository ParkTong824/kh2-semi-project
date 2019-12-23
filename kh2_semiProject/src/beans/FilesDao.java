package beans;

import java.sql.Connection;	
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FilesDao {

	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
//연결메소드	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	public void HostelUpload(FilesDto fdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into files("
							+ "file_no, hostel_no, uploadname, savename, filetype, filesize) "
							+ "values(files_no_seq.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fdto.getHostel_no());
		ps.setString(2, fdto.getUploadname());
		ps.setString(3, fdto.getSavename());
		ps.setString(4, fdto.getFiletype());
		ps.setLong(5, fdto.getFilesize());
		ps.execute();
		
		con.close();
	}
	
}
