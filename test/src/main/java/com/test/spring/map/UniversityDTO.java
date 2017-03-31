package com.test.spring.map;

//대학교 DTO
public class UniversityDTO {
 private String universitySeq;      //대학교 번호
 private String universityName;      //대학교 명
 private String universityTel;      //대학교 연락처
 private String universityLatitude;   //대학교 위도
 private String universityLongitude;   //대학교 경도
 
 
 public String getUniversityLatitude() {
    return universityLatitude;
 }
 public void setUniversityLatitude(String universityLatitude) {
    this.universityLatitude = universityLatitude;
 }
 public String getUniversityLongitude() {
    return universityLongitude;
 }
 public void setUniversityLongitude(String universityLongitude) {
    this.universityLongitude = universityLongitude;
 }
 public String getUniversitySeq() {
    return universitySeq;
 }
 public void setUniversitySeq(String universitySeq) {
    this.universitySeq = universitySeq;
 }
 public String getUniversityName() {
    return universityName;
 }
 public void setUniversityName(String universityName) {
    this.universityName = universityName;
 }
 public String getUniversityTel() {
    return universityTel;
 }
 public void setUniversityTel(String universityTel) {
    this.universityTel = universityTel;
 }
}