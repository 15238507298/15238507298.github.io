package com.zzxky_edu.beans;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileUpload {
	// 上传图片
	private List<File> image=new ArrayList<File>();
	private List<String> imageFileName=new ArrayList<String>();
	private List<String> imageContentType=new ArrayList<String>();
	// 上传视频
	private List<File> video=new ArrayList<File>();
	private List<String> videoFileName=new ArrayList<String>();
	private List<String> videoContentType=new ArrayList<String>();
	public List<File> getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image.add(image);
	}
	public List<String> getImageFileName() {
		System.out.println("getter"+imageFileName);
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		System.out.println("setter"+imageFileName);
		this.imageFileName.add(imageFileName);

	}
	public List<String> getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType.add(imageContentType);
	}
	public List<File> getVideo() {
		return video;
	}
	public void setVideo(File video) {
		this.video.add(video);
	}
	public List<String> getVideoFileName() {
		System.out.println("getter"+videoFileName);
		return videoFileName;
	}
	public void setVideoFileName(String videoFileName) {
		System.out.println("setter"+videoFileName);
		this.videoFileName.add(videoFileName);
	}
	public List<String> getVideoContentType() {
		return videoContentType;
	}
	public void setVideoContentType(String videoContentType) {
		this.videoContentType.add(videoContentType);
	}

	
}
