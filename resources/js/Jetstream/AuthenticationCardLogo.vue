<template>
    <inertia-link :href="'/'">
        <garden-app-logo class="w-60 mt-8 mb-2 sm:mt-4"></garden-app-logo>
    </inertia-link>
</template>

<script>
    import GardenAppLogo from '@/CustomComponents/GardenAppLogo'


    export default {
        components: {
            GardenAppLogo,
        },
    }
</script>
