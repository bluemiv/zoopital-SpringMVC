package com.pet.model;

public class PetDTO {
	private int pet_code; // number constraint pet_pk primary key, -- 내부 번호(pk)
	private String pet_name; // varchar2(500) not null, -- 동물 이름
	private String pet_type; // varchar2(500) not null, -- 동물 종류
	private String pet_sex; // varchar2(500) not null, -- 종물 성별
	private int pet_age; // number not null, -- 동물 나이
	private String pet_phone; // varchar2(500) not null, -- 주인 전화번호
	private int pet_postCode; // number not null, -- 우편번호
    private String pet_addr; // varchar2(3000) not null, -- 집주소
    private String pet_addrDetail; // varchar2(3000) not null, -- 상세 주소
    private String pet_email; // varchar2(1000) not null, -- 이메일
    private String store_code; // varchar2(500) -- 지점코드
	
    // set get method
    public int getPet_code() {
		return pet_code;
	}
	public void setPet_code(int pet_code) {
		this.pet_code = pet_code;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_type() {
		return pet_type;
	}
	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}
	public String getPet_sex() {
		return pet_sex;
	}
	public void setPet_sex(String pet_sex) {
		this.pet_sex = pet_sex;
	}
	public int getPet_age() {
		return pet_age;
	}
	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}
	public String getPet_phone() {
		return pet_phone;
	}
	public void setPet_phone(String pet_phone) {
		this.pet_phone = pet_phone;
	}
	public int getPet_postCode() {
		return pet_postCode;
	}
	public void setPet_postCode(int pet_postCode) {
		this.pet_postCode = pet_postCode;
	}
	public String getPet_addr() {
		return pet_addr;
	}
	public void setPet_addr(String pet_addr) {
		this.pet_addr = pet_addr;
	}
	public String getPet_addrDetail() {
		return pet_addrDetail;
	}
	public void setPet_addrDetail(String pet_addrDetail) {
		this.pet_addrDetail = pet_addrDetail;
	}
	public String getPet_email() {
		return pet_email;
	}
	public void setPet_email(String pet_email) {
		this.pet_email = pet_email;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	
}
