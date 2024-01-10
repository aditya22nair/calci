<!-- Calculator.vue -->
<template>
  <div id="calculator">
    <div class="display">{{ displayValue }}</div>
    <div class="buttons">
      <button v-for="button in buttons" :key="button" @click="handleButtonClick(button)">
        {{ button }}
      </button>
    </div>
  </div>
</template>

<script src="./components/app"></script>

<style scoped>
#calculator {
  width: 300px;
  margin: 50px auto;
  border: 1px solid  rgb(50, 65, 74);
  padding: 10px;
  border-radius: 5px;
}

.display {
  font-size: 20px;
  margin-bottom: 10px;
  padding: 5px;
  background-color: #f0f0f0;
}

.buttons {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  
}

button {
  font-size: 18px;
  padding: 10px;
  cursor: pointer;
  flex-basis: 25%;
  color: white;
  background-color: rgb(50, 65, 74);
}
</style>
