# CalendarWithTimePicker
ios로 custom calendar and time picker를 만들었다. 

## difference ✨
- 다른 유명 오픈소스와 달리, 시간도 함께 설정 할 수 있다.

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

## Screen shot 📸

|mainscreen|calendar select|next month|pre month|time picker|time select|
|:---:|:---:|:---:|:---:|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/46439995/104694091-06ea0e00-574e-11eb-8ba9-f4fdc2cbae32.png" width="200" alt="main screen" />|<img src="https://user-images.githubusercontent.com/46439995/104694359-6e07c280-574e-11eb-9821-436f1c589429.png" width="200" alt="calendar selcet" />|<img src="https://user-images.githubusercontent.com/46439995/104694386-74963a00-574e-11eb-93f6-4ba278d19cdd.png" width="200" alt="next month" />|<img src="https://user-images.githubusercontent.com/46439995/104694407-7c55de80-574e-11eb-8ea7-896b8bcba28d.png" width="200" alt="pre month" />|<img src="https://user-images.githubusercontent.com/46439995/104694450-88da3700-574e-11eb-9471-6d3a096f5306.png" width="200" alt="time picker" />|<img src="https://user-images.githubusercontent.com/46439995/104829917-27d07180-58bc-11eb-9ae5-3331692f4340.png" width="200" alt="time select" />|
