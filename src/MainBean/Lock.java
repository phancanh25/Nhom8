package MainBean;

import java.io.UnsupportedEncodingException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="Lock")
public class Lock {
	@Id
	@Column(name="Year")
	private int year;
	
	@Column(name="AddStudent")
	private boolean addStudent;
	
	@Column(name="AddTeacher1")
	private boolean addTeacher1;

	@Column(name="AddProject")
	private boolean addProject;
	
	@Column(name="Mark1")
	private boolean mark1;
	
	@Column(name="AddTeacher2")
	private boolean addTeacher2;
	
	@Column(name="Mark2")
	private boolean mark2;
	
	@Column(name="ToCMT")
	private boolean toCMT;
	
	@Column(name="Mark3")
	private boolean mark3;
	
	@Lob
	@Column(name="Picture")
	private byte[] picture;
	
	@Column(name="Detail")
	private String detail;

	public Lock() {
		super();
	}

	public Lock(int year, boolean addStudent, boolean addTeacher1, boolean addProject, boolean mark1,
			boolean addTeacher2, boolean mark2, boolean toCMT, boolean mark3, byte[] picture, String detail) {
		super();
		this.year = year;
		this.addStudent = addStudent;
		this.addTeacher1 = addTeacher1;
		this.addProject = addProject;
		this.mark1 = mark1;
		this.addTeacher2 = addTeacher2;
		this.mark2 = mark2;
		this.toCMT = toCMT;
		this.mark3 = mark3;
		this.picture = picture;
		this.detail = detail;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public boolean isAddStudent() {
		return addStudent;
	}

	public void setAddStudent(boolean addStudent) {
		this.addStudent = addStudent;
	}

	public boolean isAddTeacher1() {
		return addTeacher1;
	}

	public void setAddTeacher1(boolean addTeacher1) {
		this.addTeacher1 = addTeacher1;
	}

	public boolean isAddProject() {
		return addProject;
	}

	public void setAddProject(boolean addProject) {
		this.addProject = addProject;
	}

	public boolean isMark1() {
		return mark1;
	}

	public void setMark1(boolean mark1) {
		this.mark1 = mark1;
	}

	public boolean isAddTeacher2() {
		return addTeacher2;
	}

	public void setAddTeacher2(boolean addTeacher2) {
		this.addTeacher2 = addTeacher2;
	}

	public boolean isMark2() {
		return mark2;
	}

	public void setMark2(boolean mark2) {
		this.mark2 = mark2;
	}

	public boolean isToCMT() {
		return toCMT;
	}

	public void setToCMT(boolean toCMT) {
		this.toCMT = toCMT;
	}

	public boolean isMark3() {
		return mark3;
	}

	public void setMark3(boolean mark3) {
		this.mark3 = mark3;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	//chuyen hinh saang base64 de xuat hinh
	 public String getBase64Photo() {
		   String base64DataString = null;
		   if(this.picture != null) {
			   byte[] encode = java.util.Base64.getEncoder().encode(this.getPicture());
			   try {
				   base64DataString = new String(encode, "UTF-8");
			   }
			   catch(UnsupportedEncodingException e) {
				   System.out.println("Lỗi khi chuyển base64 hình ảnh: "+e.getMessage());
			   }
		   }
		   return base64DataString;
	   }
	
	
}
