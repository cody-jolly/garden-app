<template>
    <div>
        <ul>
            <li v-for="bed in beds" :key="bed.id">
                <div v-if="gardenId == bed.garden_id" class="m-4 p-2 border relative">
                    <bed-details :bedId="bed.id" :bedLength="bed.length" :bedWidth="bed.width" :bedNumber="bed.bed_number" :bedVarieties="bed.bedVarieties" />
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
    import BedDetails from '@/CustomComponents/Bed/BedDetails'

    export default {
        props: ['gardenId'],

        components: {
            BedDetails,
        },

        computed: {
            beds: function () {
                return this.$page.props.beds
            }
        },
    }
</script>
