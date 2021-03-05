<template>
    <Modal>
        <template v-slot:body>
            <form @submit.prevent="createPreinfo">
                <div>
                    <label for="question">内容</label>       
                    <input class="input" type="text" placeholder="得たい情報" v-model="preinfo.question" required>
                </div>
                <div class="text_underline"></div>
                    <router-link :to="{name: 'Section', params: {id: preinfo.book_id}}">
                        <button class="modal-default-button" type="submit">
                            <slot name="button">登録</slot>
                        </button>
                    </router-link>
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
    data: function(){
        return {
            preinfo: {
                book_id: 1, 
                question: ""
            }
        }
    },
    components: {
        Modal
    },
    methods: {
         checkForm: function () {
            if (this.name && this.age) {
            return true;
            }
        },
        createPreinfo: function(){
            axios
                .post('api/v1/preinfo.json', this.preinfo)
                .catch(error => {
                    console.error(error);
                    if (error.response.data && error.response.data.errors) {
                        this.errors = error.response.data.errors;
                    }
                });
        },
        redirect: function(){
               window.location = "/part";    
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
    bottom: 0px; /*中央配置*/
    width: 0px; /*アニメーションで0pxから50%に*/
    height: 1px; /*高さ*/
    content: '';
    background-color: #3be5ae; /*アニメーションの色*/
    transition: all 0.5s;
    -webkit-transition: all 0.5s;
}
.text_underline::before{
    position: absolute; 
    left: 0px; /*左配置 ここright: 0px;にすると右から左のアニメーション*/
    bottom: 0px; /*左配置*/
    width: 0px; /*アニメーションで0pxから100%に*/
    height: 1px; /*高さ*/
    content: '';
    background-color: #3be5ae; /*アニメーションの色*/
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