document.getElementById('shareBtn').onclick = function() {
   document.getElementById('shareModal').style.display = 'block';
}

document.getElementsByClassName('close')[0].onclick = function() {
   document.getElementById('shareModal').style.display = 'none';
}

window.onclick = function(event) {
   if (event.target != document.getElementById('shareBtn') && event.target != document.getElementById('shareModal')) {
      document.getElementById('shareModal').style.display = 'none';
   }
}
