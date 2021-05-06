//package MainBean;
//import java.util.Collection;
//
//import javax.persistence.Column;
//import javax.persistence.Embeddable;
//import javax.persistence.Embedded;
//import javax.persistence.EmbeddedId;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.OneToMany;
//import javax.persistence.ManyToOne;
//import javax.persistence.MapsId;
//import javax.persistence.Table;
//import javax.persistence.Temporal;
//import javax.persistence.TemporalType;
//
//import org.hibernate.annotations.ManyToAny;
//
//
//@Entity
//@Table(name="ChiTietTieuBan")
//public class ChiTietTieuBan {
//	
//	@EmbeddedId
//	ChiTietTieuBanKey id;
//	
//	@ManyToOne
//	@MapsId("maGV")
//	@JoinColumn(name="MaGV")
//	GiangVien giangvien;
//	
//	@ManyToOne
//	@MapsId("maTB")
//	@JoinColumn(name="MaTB")
//	TieuBan tieuban;
//	
//	@Column(name="ChiTiet")
//	private String chiTiet;
//
//	
//	public ChiTietTieuBan(ChiTietTieuBanKey id, GiangVien giangvien, TieuBan tieuban, String chiTiet) {
//		super();
//		this.id = id;
//		this.giangvien = giangvien;
//		this.tieuban = tieuban;
//		this.chiTiet = chiTiet;
//	}
//
//
//	public ChiTietTieuBan() {
//		super();
//	}
//
//
//	public ChiTietTieuBanKey getId() {
//		return id;
//	}
//
//
//	public void setId(ChiTietTieuBanKey id) {
//		this.id = id;
//	}
//
//
//	public GiangVien getGiangvien() {
//		return giangvien;
//	}
//
//
//	public void setGiangvien(GiangVien giangvien) {
//		this.giangvien = giangvien;
//	}
//
//
//	public TieuBan getTieuban() {
//		return tieuban;
//	}
//
//
//	public void setTieuban(TieuBan tieuban) {
//		this.tieuban = tieuban;
//	}
//
//
//	public String getChiTiet() {
//		return chiTiet;
//	}
//
//
//	public void setChiTiet(String chiTiet) {
//		this.chiTiet = chiTiet;
//	}
//
//	
//	
//}
