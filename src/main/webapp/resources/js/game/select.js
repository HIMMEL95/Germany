function setSelectBox(obj) {
	var selectVal = obj.value;
	var upper = $(obj).parent().parent();
	
	var cnt = $('select', upper).size();
	var idx = $('select', upper).index(obj);
	var depth = idx + 1;
	var level = 4 + idx;
	
	var selectBox = $('select', upper).eq(depth);
	var text = '<option value="" >선택</option>';
	var selectVal02 = selectVal.subString(2,4);
	
	if (selectVal == '') {
		$('select:gt(' + idx + ')', upper).html(text);
		$('select:gt(' + idx + ')', div).attr("disabled", true);
		return ;
	}
	
	$.post("/game/setSelect"
		, {"level": level, "selectVal": selectVal, "selectVal02":selectVal02}
		, function(res) {
			if (res.result > 0) {
				var dirList = eval(res.resultJList);
				var loop = res.resultCnt;
				
				$('select:gt(' + idx + ')', upper).html(text);
				selectBox.attr("disabled". false);
				
				for (var i=0; i<loop; i++) {
					 var list = dirList[i];
					 selectBox.append('<option value="' + list.selectVal + '">' + list.valName + '</option>');
				}
			}
		}
	);
}