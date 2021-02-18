package egovframework.corona.main.service;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.activation.DataSource;

public class ByteArrayDataSource implements DataSource{
	
	byte[] bytes;
	String contentType;
	String name;
	
	public ByteArrayDataSource(byte[] bytes, String contentType, String name){
		this.bytes = bytes;
		if(contentType == null){
			this.contentType = "application/otect-stream";
		}else
			this.contentType = contentType;
		this.name = name;
	}

	@Override
	public String getContentType() {
		// TODO Auto-generated method stub
		return contentType;
	}

	@Override
	public InputStream getInputStream() throws IOException {
		// TODO Auto-generated method stub
		return new ByteArrayInputStream(bytes, 0, bytes.length -2);
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return name;
	}

	@Override
	public OutputStream getOutputStream() throws IOException {
		// TODO Auto-generated method stub
		throw new FileNotFoundException();
	}
	

}
