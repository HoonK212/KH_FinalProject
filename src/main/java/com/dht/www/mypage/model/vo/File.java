package com.dht.www.mypage.model.vo;

public class File {
	
	private int no;
	private int type;
	private String ref;
	private String path;
	private String origin;
	private String rename;
	private String ext;
	private int size;
	private int thumbnail;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getRename() {
		return rename;
	}
	public void setRename(String rename) {
		this.rename = rename;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(int thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	@Override
	public String toString() {
		return "File [no=" + no + ", type=" + type + ", ref=" + ref + ", path=" + path + ", origin=" + origin
				+ ", rename=" + rename + ", ext=" + ext + ", size=" + size + ", thumbnail=" + thumbnail + "]";
	}
	
}
