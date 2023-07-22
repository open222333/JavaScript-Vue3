<template>
  <p></p>
  <div id="div_a"></div>
  <div id="div_b"></div>
  <div id="div_c"></div>
<p></p>
</template>

<style scoped>
p {
  top: 10px;
  bottom: 10px;
}
#div_a {
  display: inline-block;
  background-color: #eee;
  width: 150px;
  height: 50px;
  margin-right: 20px;
  box-shadow: 3px 3px 9px rgb(200, 200, 99);
}
#div_b {
  display: inline-block;
  background-color: #eee;
  width: 150px;
  height: 50px;
  margin-right: 20px;
  box-shadow: 0px 0px 9px green;
}
#div_c {
  display: inline-block;
  background-color: #eee;
  width: 150px;
  height: 50px;
  margin-right: 20px;
  box-shadow: -3px -3px 9px pink;
}
</style>
