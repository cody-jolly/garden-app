<template>
    <div>
        <ul>
            <li v-for="garden in gardens" :key="garden.id">
                <div class="m-4 p-2 border relative">
                    <garden-details :gardenId="garden.id" :gardenName="garden.name" />
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
    import GardenDetails from "@/CustomComponents/Garden/GardenDetails";

    export default {
        components: {
            GardenDetails,
        },

        computed: {
            gardens: function () {
                return this.$page.props.gardens
            },
        },
    }
</script>
