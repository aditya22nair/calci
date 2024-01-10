import { defineComponent, ref } from "vue";


export default defineComponent({
    setup() {
        const displayValue = ref('0');
        const buttons = ['7', '8', '9', '/', '4', '5', '6', '*', '1', '2', '3', '-', '0', 'C', '=', '+'];

        const handleButtonClick = (button) => {
            if (button === '=') {
                calculate();
            } else if (button === 'C') {
                clear();
            } else {
                updateDisplay(button);
            }
        }
        const calculate = () => {
            try {
                displayValue.value = eval(displayValue.value).toString();
            } catch (error) {
                displayValue.value = 'Error';
            }
        }
        const clear = () => {
            displayValue.value = '0';
        }
        const updateDisplay = (value) => {
            if (displayValue.value === '0') {
                displayValue.value = value;
            } else {
                displayValue.value += value;
            }
        }

        return {
            buttons,
            displayValue,
            handleButtonClick,
            calculate,
            clear,
            updateDisplay
        }
    }
})
