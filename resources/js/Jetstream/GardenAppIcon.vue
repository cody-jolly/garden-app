<template>
    <img :src="iconPath" alt="garden app icon">
</template>

<script>
    export default {
        computed: {
            iconPath: function () {
                return this.$page.props.appPath + "/storage/img/garden-app-icon.svg"
            }
        },
    }
</script>
