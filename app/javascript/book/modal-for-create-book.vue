<template>
    <Modal>
        <template v-slot:body>
            <form @submit.prevent="createBook">
                <div v-if="errors.length != 0">
                    <ul v-for="e in errors" :key="e">
                        <li><font color="red">{{ e }}</font></li>
                    </ul>
                </div>
                <div class="group">
                    <label for="title" id="l_title">タイトル</label>
                    <input class="input" type="text" placeholder="タイトルを入力する" v-model="book.title" required>
                    <div class="text_underline"></div>
                </div>
                <div class="group">
                    <label for="author" id="l_author">著者</label>
                    <input class="input" type="text" placeholder="著者を入力する" v-model="book.author" required>
                    <div class="text_underline"></div>
                </div>
                <div class="group">
                    <label for="image" id="l_title">表紙</label>
                    <input class="input" type="file" accept="image/*" @change="onImageUploaded">
                    <div class="text_underline"></div>
                </div>
                <button class="modal-default-button" @click="$emit('next')" type="submit">
                    <slot name="button">次へ</slot>
                </button>
                <button class="modal-default-button close-button" @click="$emit('close')">
                        <slot name="close-button">閉じる</slot>
                </button>
            </form>
        </template>
    </Modal>
</template>

<script>
import axios from 'axios'
import Modal from "/app/javascript/common/modal"

export default {
    data: function () {
    return {
      book: {
        title: "",
        author: "",
        image: null
      },
      errors: ""
    }
    },
    components:{
        Modal,
    },
    methods: {
        createBook: function(){
            axios
                .post('api/v1/book.json', this.book)
                .catch(error => {
                    console.error(error);
                    if (error.response.data && error.response.data.errors) {
                        this.errors = error.response.data.errors;
                    }
                });
        },
        onImageUploaded(e){
            const image = e.target.files[0]
            this.createImage(image)
        },
        createImage(image) {
            const reader = new FileReader()
            reader.readAsDataURL(image)
            reader.onload = () => {
                this.book.image = reader.result
            }
        },
        checkForm(e){
            if (this.name && this.age) {
            return `$emit(${e})`;
            }
        }
    }
}   
</script>

<style scoped>
.input{
    font-size: 16px;
    width: 100%;
    border: none;
    outline: none;
    padding-bottom: 8px;
    box-sizing: border-box; /*横幅の解釈をpadding, borderまでとする*/
}

.text_underline{
    position: relative; /*.text_underline::beforeの親要素*/
    border-top: 1px solid #c2c2c2; 
    /* padding-bottom: 8px; */
}

/*共通のstyle*/
.text_underline::before,
.text_underline::after{
    position: absolute; 
    bottom: 0px; 
    width: 0px; 
    height: 1px; 
    content: '';
    background-color: #3be5ae; 
    transition: all 0.5s;
    -webkit-transition: all 0.5s;
}
.text_underline::before{
    position: absolute; 
    left: 0px; 
    bottom: 0px; 
    width: 0px; 
    height: 1px; 
    content: '';
    background-color: #3be5ae;
    transition: all 0.5s;
    -webkit-transition: all 0.5s;
}

.input:focus + .text_underline::before{
    width: 100%;
}
.modal-default-button {
  float: right;
  padding-top: 20px;

}
.close-button{
  padding-right: 24px;
  padding-top: 20px;

}
</style>