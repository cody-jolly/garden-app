<template>
    <img :src="logoPath" alt="garden app logo">
</template>

<script>
    export default {
        computed: {
            logoPath: function () {
                return this.$page.props.appPath + "/storage/img/garden-app-logo.svg"
            }
        },
    }
</script>
