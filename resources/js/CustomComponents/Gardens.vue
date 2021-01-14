<!--TODO finish GardenOverview-->
<template>
    <div id="garden-section">
        <div class="p-6 sm:px-20 bg-white border-b border-gray-200">
            <div v-if="$page.props.user">
                <div class="p-4 m-2 border-b border-gray-200">
                    <add-garden-form />
                </div>
                <div class="p-4 m-2 border-b border-gray-200">
                    <garden-overview />
                </div>
            </div>
            <div v-else>
                Bitte melden Sie sich an, um diesen Bereich zu sehen.
            </div>
        </div>
    </div>
</template>

<script>
    import AddGardenForm from '@/CustomComponents/AddGardenForm'
    import GardenOverview from '@/CustomComponents/GardenOverview'

    export default {
        components: {
            AddGardenForm,
            GardenOverview,
        },

    }
</script>


