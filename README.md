# CalendarWithTimePicker
ios로 custom calendar and time picker를 만들었다. 

## feature ✨
- 다른 유명 오픈소스와 달리, 시간도 함께 설정 할 수 있다.

## requirements 📝
- ios 13 or above

## tech 🛠
- storyboard 
  - view controller UI를 위해 
  - segue는 따로 사용하지 않음
- xib
  - 재사용성을 위해, 별도의 xib로 `custom calendar and time picker view` 를 제작
  - `custom calendar and time picker view` 에서 collectionView (달력 date 숫자 부분) cell 관리
- swift5

## file structure 📂
- WholeCalendarTime
  - CalendarTimeViewController.swift
  - CalendarTimeViewController.xib
- Cells
  - DateCollectionViewCell.swift
  - DateCollectionViewCell.xib
- Extensions
  - String.swift
  - Date.swift
  - UIView.swift
  
## usage 💁‍♂️
1. 달력을 띄우고 싶은 view 안에, 함수를 추가해 줍니다.
    - 예를 들어, 버튼을 눌렀을 떄 달력을 띄우게 된다면, 아래와 같이 함수를 사용가능합니다.
    - 이때, modalPresentaionStyle을 .overCurrentContext로 하였습니다.
    - 만약, calendar의 backgroundColor를 변경하고 싶다면,```CalendarTimeViewController.xib``` 에서 BackGround 의 color를 변경해주면 됩니다. (opacity도 가능 : alpha 사용)
    
   ```
      @IBAction func didTapCalendar(_ sender: Any) {
        let calendarView = CalendarTimeViewController()
        calendarView.modalPresentationStyle = .overCurrentContext
        self.present(calendarView, animated: true, completion: nil)
    }
   ```

   
2. date selected 되는 원의 color를 바꾸고 싶다면, 이미지 set을 추가하셔야 합니다.
    - 추후에 view 로 수정 예정
  
3. date는 ```DateCollectionViewCell```로 관리 합니다.
    - 이 부분에서 date의 label 속성등을 변경 할 수 있습니다.

## Screen shot 📸
|mainscreen|calendar select|next month|previous month|time picker|time select|
|:---:|:---:|:---:|:---:|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/46439995/104694091-06ea0e00-574e-11eb-8ba9-f4fdc2cbae32.png" width="200" alt="main screen" />|<img src="https://user-images.githubusercontent.com/46439995/104694359-6e07c280-574e-11eb-9821-436f1c589429.png" width="200" alt="calendar selcet" />|<img src="https://user-images.githubusercontent.com/46439995/104694386-74963a00-574e-11eb-93f6-4ba278d19cdd.png" width="200" alt="next month" />|<img src="https://user-images.githubusercontent.com/46439995/104694407-7c55de80-574e-11eb-8ea7-896b8bcba28d.png" width="200" alt="pre month" />|<img src="https://user-images.githubusercontent.com/46439995/104694450-88da3700-574e-11eb-9471-6d3a096f5306.png" width="200" alt="time picker" />|<img src="https://user-images.githubusercontent.com/46439995/104829917-27d07180-58bc-11eb-9ae5-3331692f4340.png" width="200" alt="time select" />|
