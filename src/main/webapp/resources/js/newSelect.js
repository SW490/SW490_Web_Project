$(document).ready(function () {
  let cate1Select = $('select.category1');
  let cate2Select = $('select.category2');

  function filterCate2() {
    let selectedCate1 = cate1Select.val(); // 선택된 1차 카테고리
    cate2Select.children().hide(); // 모든 옵션 숨기기
    cate2Select.find('option[value=""]').show(); // '전체' 옵션 보이기

    // 선택된 1차 카테고리에 속하는 2차 카테고리만 표시
    cate2Select.find(`option[data-ref='${selectedCate1}']`).show();
  }

  // 페이지 로드 시, 2차 카테고리 필터링
  filterCate2();

  // 1차 카테고리가 변경되면 2차 카테고리 필터링 적용
  cate1Select.on('change', function () {
    filterCate2();
    cate2Select.val(''); // 1차 카테고리가 변경되면 2차 선택 초기화
  });
});
