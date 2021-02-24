<template>
    <li>
        {{bookItem.title}}
        {{bookItem.author}}
    </li>
</template>

<script>
export default {
    props: {
        bookItem: {
            type: Object,
            default: null,
            required: 1
        }
    }
}
</script>