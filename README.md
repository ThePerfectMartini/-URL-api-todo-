# UserDefaults 사용 URL세션 api 테스트 todo리스트
UserDefaults and URLSession API Test

<img src="https://capsule-render.vercel.app/api?type=waving&color=auto&height=200&section=header&text=ToDoApp&fontSize=90" />

# Architectural Patterns
아키텍처 패턴

<li>MVVM 패턴을 사용</li>

  DataModel은 앱의 raw 데이터들을 모두 가지고있고 singleton 으로 구현했다.<br>
  그리고 앱이 사용하는 class와 struct를 정의하는 곳이다.<br>

  HomeViewController와 TableViewController가 view의 역할을 하며<br>
  UI를 그려주는 것들을 전담하고 그 이외의 기능은 없다.<br>

  HomeViewModel, TableViewModel에서 DataModel의 데이터를 알맞은 타입으로 변환하여 가지고 있고<br>
  각각의 view들과 데이터 바인딩이 되어있어 viewModel에서의 수정이 브로드캐스팅되어 view가 화면을 다시 그린다.<br>
  view에서는 viewModel에 접근하여 viewModel에 있는 함수를 실행시키고 내부의 함수가 viewModel의 데이터를 바꾸고<br>
  바꾼 사실이 브로드캐스팅되어 view에 적용되는 형태이다.<br>


# Life Cycle
라이프사이클

<li>HomeView</li>

HomeView에서 어플이 실행되어 viewDidLoad가 되었을때 랜덤 고양이 이미지를 불러온다<br>
이후 뷰가 disappear 될 때 api에서 랜덤 고양이 이미지의 주소를 미리 받고 미리 화면을 다시 그린다.<br>
그래서 이후에 다시 HomeView에 접근하면 이미지가 새로고쳐진 것을 확인할 수 있다.<br>


# UserDefaults
유저디폴츠

UserDefault에 데이터를 저장할 때 TableViewCell 에 그려줄 데이터들이 하나가 아닌 여러개를 가지고 있었으면 했다.<br>
그래서 데이터의 class를 생성하여 [TodoDataCell] 형태로 배열로 저장했다.<br>
저장하기 위해 dataClass들을 각각 encode해서 encodedList에 [Data] 형태로 저장한 뒤 DataModel에 저장한다.<br>
이후 UserDefaults에 set을 이용해 저장해준다.<br>
불러올 경우에는 Array 형태로 불러온 뒤 [Data]를 encodedList에 저장해주고 각각 decode해서 viewModel의 cellList[TodoDataCell]에 저장한다.<br>
