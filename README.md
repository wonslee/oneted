# oneted **프로젝트 소개**

- 소셜 커리어 플랫폼 wanted(원티드) 클론 프로젝트
- 프로젝트 기간이 길지 않아 전체가 아닌 일부 기능에 집중해 기획했습니다.
- 개발은 초기 세팅부터 전부 직접 구현했으며, 아래 데모 영상에서 보이는 부분은 일부 백엔드와 연결하여 실제 사용할 수 있는 서비스 수준으로 개발되었습니다.

### **개발 인원 및 기간**

- 개발 기간 : 2021. 07. 19 ~ 2021. 07. 30 (2주)
- 개발 인원 : 프론트엔드 3명, 백엔드 2명
- [프론트엔드 github 링크](https://github.com/wecode-bootcamp-korea/22-2nd-Oneted-frontend)
- [백엔드 github 링크](https://github.com/wecode-bootcamp-korea/22-2nd-Oneted-backend)

### **프로젝트 선정이유**

- 기업과 취업 중인 고객을 서로 매칭해 지원을 하는 시스템이 매력적으로 다가와 진행하게 되었습니다.

### **데모 영상(이미지 클릭)**

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/caab510e-b24a-4363-955e-1d2b98c31144/스크린샷_2021-07-30_오후_4.51.48.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/caab510e-b24a-4363-955e-1d2b98c31144/스크린샷_2021-07-30_오후_4.51.48.png)

# **적용 기술 및 구현 기능**

## **적용 기술**

- Front-End : React, Styled Component, html2canvas, Chartjs, Swiper
- Back-End : Python, Django web framework, PyJWT, MySQL, s3transfer
- Common : KAKAO social login, AWS(EC2, RDS, S3), RESTful API

## 모델링 ERD

![https://files.slack.com/files-pri/TH0U6FBTN-F029Q1TS20M/______________2021-07-31_20-25-17.png]

## 구현 기능

### 로그인 & 회원가입

- 소셜 로그인 (카카오 API)
- 토큰 확인 decorator에서 JWT 토큰 발행

### 검색(필터링)

- 여러가지 조건(직종, 태그, 지역, 최신순 등)에 대한 채용공고 필터링 기능
- select_related을 통한 캐싱 (ORM 최적화)
- Q객체와 filter사용

### 검색어 추천

- 검색창에 타이핑한 단어를 채용공고, 회사, 태그 중에서 찾아서 추천해주는 기능
- filter 사용

### 파일 이력서 생성
- 파일을 첨부하여 요청하면 S3 스토리지에 저장하는 기능
- S3boto 모듈 사용

### 글 이력서 CRUD
- 글 이력서를 생성, 수정, 삭제, 조회할 수 있는 기능
- django ORM의 기본적인 CRUD 함수 사용

### 북마크 생성과 삭제
- 채용공고에 대한 유저의 북마크를 관리
- get_or_create 사용

### 지원
- 선택된 이력서들을 토대로 특정 채용공고에 지원하는 기능

### 직군별 연봉
- 직군별 연봉을 신입 ~ 9년차의 10가지 경력에 대해 평균치를 조회하는 기능
- annotate(SQL JOIN) 함수 사용

### 채용공고 상세
- 채용공고의 상세 정보 조회
- filter 사용

### 유저 정보
- 토큰에 담긴 유저 정보 조회

### 직군과 직종, 태그와 태그 카테고리 정보
- 검색 페이지와 직군별 연봉 페이지에서 사용되는 채용공고의 메타 데이터 조회


## **Reference**

- 이 프로젝트는 소셜 커리어 플랫폼 wanted(원티드) 사이트를 참조하여 학습 목적으로 만들었습니다.
- 실무수준의 프로젝트이지만 학습용으로 만들었기 때문에 이 코드를 활용하여 이득을 취하거나 무단 배포할 경우 법적으로 문제될 수 있습니다.
- 이 프로젝트에서 사용하고 있는 사진 대부분은 위코드에서 구매한 것이므로 해당 프로젝트 외부인이 사용할 수 없습니다.