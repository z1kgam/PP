/**
 * 
 */

function explanation() {
	document.getElementById("explanation").style.display = "block";
	document.getElementById("reply").style.display = "none";
	document.getElementById("review").style.display = "none";
	document.getElementById("trybuy").style.display = "none";
}

function reply() {
	document.getElementById("explanation").style.display = "none";
	document.getElementById("reply").style.display = "block";
	document.getElementById("review").style.display = "none";
	document.getElementById("trybuy").style.display = "none";
}

function review() {
	document.getElementById("explanation").style.display = "none";
	document.getElementById("reply").style.display = "none";
	document.getElementById("review").style.display = "block";
	document.getElementById("trybuy").style.display = "none";
}

function trybuy() {
	document.getElementById("explanation").style.display = "none";
	document.getElementById("reply").style.display = "none";
	document.getElementById("review").style.display = "none";
	document.getElementById("trybuy").style.display = "block";
}

function openreply() {
	var form = document.frmReply;
	var contextPath = document.getElementById("contextPath").value;
	form.parentsnum.value = 0;
	document.getElementById("write").style.display = "block";
}

function hide() {
	document.getElementById("write").style.display = "none";
}

function doublereply(num) {
	var form = document.frmReply;
	var contextPath = document.getElementById("contextPath").value;
	form.parentsnum.value = num;
	document.getElementById("write").style.display = "block";
}

function updatereply(num) {
	var form = document.upReply;
	var contextPath = document.getElementById("contextPath").value;
	form.replynum.value = num;
	document.getElementById("upwrite").style.display = "block";
}
function uphide() {
	document.getElementById("upwrite").style.display = "none";
}

$(function() {
	$( "#testDatepicker" ).datepicker({
	});
});


