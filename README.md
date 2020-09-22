## Teachablemachine을 활용한 홈트레이닝 웹 프로젝트:muscle:
<!--KH정보교육원 | [NCS]UIUX엔지니어링 및 응용SW 엔지니어링 양성과정 | 파이널 프로젝트 - 데일리 홈 트레이닝-->

![Contributors][contributors-shield]
![Forks][forks-shield]
[![Stargazers][stars-shield]][stars-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="http://ec2-13-58-141-230.us-east-2.compute.amazonaws.com/main">
<img src="/src/main/webapp/resources/image/logo.png" alt="Logo" width="90" height="90">
  </a>

  <h3 align="center">Daily Home Training</h3>


<p align="center">
<a href="https://docs.google.com/presentation/d/1iuE2iADcCUhdSmPSroiDmHCLeNlZcPa0KIJDjcHHadM/present?ueb=true&slide=id.g99697c53c3_2_75">프로젝트 사용 설명</a>
·
<a href="https://drive.google.com/file/d/1vlXfOw1kVsb-MrWxl_SBXJBDiX2si5d7/view?usp=sharing">프로젝트 구현 내용</a>
  </p>
</p>


<!-- TABLE OF CONTENTS -->
<!--
[![Everything Is AWESOME](https://drive.google.com/file/d/1YEdA2kfopd7Xm5NoV_jGcTBd-vAESnGc/view?usp=sharing)](https://www.youtube.com/watch?v=Kwo-cz8rn2U&list=PLgbeHDZM_xxI_9jEiNFwYJ2vGZoCThY0G )
-->

## 운동 시연 (이미지 클릭)
  <a href="https://www.youtube.com/watch?v=Kwo-cz8rn2U&list=PLgbeHDZM_xxI_9jEiNFwYJ2vGZoCThY0G">
<img src="/src/main/webapp/resources/image/youtube.png" alt="Logo" width="600" height="360">
  </a>
 

---

## Daily Home Training 프로젝트
* 프로젝트 기간 : 2020.07.29 ~ 2020.09.20
* 7인 팀프로젝트
* KH 정보교육원 파이널프로젝트

---

## 프로젝트 개요

2019년 12월 발생한 신종 코로나 바이러스(COVID-19) 장기화로 인해 활동량이 급감한 사용자들에게 홈 트레이닝 서비스를 제공하며, 동시에 관련 제품 판매로 수익모델을 구축한다.

---

## 웹 어플리케이션 주요기능

* 회원가입
  * Alpine JS를 활용한 회원가입
  * 메일 인증
  * 비밀번호 암호화
  * 자동 가입 방지를 위한 캡챠 API
  * 아이디 찾기
  * 비밀번호 찾기
* 로그인
  * 일반 로그인
  * 소셜 로그인 : 카카오 Social Login API를 활용한 로그인   
* 운동
  * 티처블 머신을 활용한 홈트레이닝 기능
  * 카카오 음성 API를 활용하여 안내 음성 지원
  * 운동 목표 달성 시 포인트와 코인 지급
* 이벤트
  * FullCalendar API를 활용한 출석 체크 기능
  * 티처블 머신을 활용한 가위바위보 게임 기능
  * 룰렛 돌리기 게임
  * 초성 퀴즈 게임
  * 신기록 랭킹 이벤트
    * 프로시저와 Oracle Job을 활용한 자동 보상 지급 기능
* 포인트&코인
  * 운동 목표 달성을 통한 코인 지급 기능
  * 운동과 이벤트를 활용하여 포인트 적립 기능
  * 쇼핑 시 적립한 포인트 사용 기능
* 쇼핑
  * 쇼핑 리스트 출력 기능
  * 검색 기능
  * 쇼핑 상세페이지 출력(상품 상세 정보, 별점, 리뷰 정보)
  * 장바구니 담기 기능(로그인 되지 않은 상태일 경우, 세션에 저장하며 로그인 후에 테이블에 저장하는 로직으로 구현하여 비회원도 장바구니 사용 가능)
  * 아임포트 API, GSON API를 활용한 결제 기능
* 커뮤니티
  * 게시판 게시글/댓글 작성
  * 게시글/댓글 좋아요/싫어요
  * 게시글 신고
* 마이페이지
  * FullCalendar API를 활용한 사용자 운동 목표 및 달성 내용 출력
  * 운동 목표 설정 기능 : 운동 종류, 요일, 단계 설정
  * 회원정보 수정
  * 포인트 현금 전환
  * 회원이 작성한 게시글/댓글 조회 및 삭제
  * 구매 내역 조회 및 반품 신청
  * 배송 완료된 상품에 대한 후기 작성
* 관리자페이지
  * 상품 등록 및 관리
  * 상품에 대한 매출 조회
  * 상품 재고 관리
  * 트리거 기능을 활용한 상품 배송 내역 관리
  * 회원관리
  * 트리거 기능을 활용한 신고 관리 기능
* 기타
  * LogAOP
  * 접속권한을 관리하는 Interceptor

---

## 개발환경

  |구 분|항 목|
  |:-------:|:------:|
  |OS|**Winndows 10**|
  |Server / DBMS|**AWS (RedHat8) / OracleCloud(19c)**|
  |FrameWork / Platform|**Bootstrap, jQuery, Spring, Mybatis, Tailwind, AlpineJS**|
  |Development Languages|**JAVA, JSP, JavaScript, SQL, HTML, CSS**|
  |Development Tools|**Star UML, DRAW IO, ErdColud, Figma, Groom IDE, Eclipse, SQL Developer**|
  |Share Tools|**GitHub, Source Tree, Trello, Slack**|

---





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/HoonK212/KH_FinalProject.svg?style=flat-square
[contributors-url]: https://github.com/HoonK212/KH_FinalProject/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/HoonK212/KH_FinalProject.svg?style=flat-square
[forks-url]: https://github.com/HoonK212/KH_FinalProject/network/members
[stars-shield]: https://img.shields.io/github/stars/HoonK212/KH_FinalProject.svg?style=flat-square
[stars-url]: https://github.com/HoonK212/KH_FinalProject/stargazers
