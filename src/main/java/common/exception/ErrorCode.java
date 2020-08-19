package common.exception;

public enum ErrorCode {

	// 에러코드 예시 -> 수정해서 사용
	M_ERROR_01("메일 전송 중 에러가 발생하였습니다.", "mail.do"),
	F_ERROR_02("파일 등록 중 에러가 발생하였습니다.", "file.do");
	
	private final String MESSAGE;
	private final String URL;

	ErrorCode(String msg, String url) {
		this.MESSAGE = msg;
		this.URL = url;
	}

	public String getMESSAGE() {
		return MESSAGE;
	}
	public String getURL() {
		return URL;
	}
	
}
