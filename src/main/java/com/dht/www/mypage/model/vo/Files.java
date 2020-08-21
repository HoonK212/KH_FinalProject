package com.dht.www.mypage.model.vo;

public class Files {
	
	private int no;
	private int type;
	private String ref;
	private String path;
	private String origin;
	private String renamed;
	private String ext;
	private int sizes;
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
	public String getRenamed() {
		return renamed;
	}
	public void setRenamed(String renamed) {
		this.renamed = renamed;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public int getSizes() {
		return sizes;
	}
	public void setSizes(int sizes) {
		this.sizes = sizes;
	}
	public int getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(int thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	@Override
	public String toString() {
		return "Files [no=" + no + ", type=" + type + ", ref=" + ref + ", path=" + path + ", origin=" + origin
				+ ", renamed=" + renamed + ", ext=" + ext + ", sizes=" + sizes + ", thumbnail=" + thumbnail + "]";
	}
	
}
