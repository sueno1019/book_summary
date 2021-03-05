<template>
    <div>
        {{sectionItem.name}}
    </div>
</template>

<script>
export default {
    props: {
        sectionItem :{
            type: Object,
            default: null,
            required: 1
        }
    }
}
</script>