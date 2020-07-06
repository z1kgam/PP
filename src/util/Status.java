package util;

import java.util.ArrayList;
import java.util.Iterator;

public class Status {

	private ArrayList exceptions;
	public Status() {
		exceptions = new ArrayList();
	}
	public boolean isSuccessful() {
		return (exceptions.size() == 0);
	}
	public void addException(Exception e){
		exceptions.add(e);
	}
	public Iterator getExceptions() {
		return exceptions.iterator();
	}
}
