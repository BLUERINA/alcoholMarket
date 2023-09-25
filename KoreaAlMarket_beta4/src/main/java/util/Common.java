package util;

public interface Common {
	public String PATH = "/WEB-INF/views/menu/";
	public String P_PATH = "/WEB-INF/views/detailPage/";
	
	//한 페이지에 보여줄 게시물 수
	public static int BLOCKLIST = 5;
	
	//한 페이지에 보여질 페이지 메뉴의 수
	//< 1, 2, 3 >
	public static int BLOCKPAGE = 3;
	
	public String S_PATH="/WEB-INF/views/shop/";
	
	public void delete(int idx);

}
