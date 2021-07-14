<template>
    <div>
        <h2 class="font-bold text-lg m-1">Varieties</h2>
        <div v-for="variety in $page.props.varieties">
            <div class="m-3">
                <admin-update-variety-information-form :variety="variety" />
            </div>
        </div>
        <div>
            <div class="m-3">
                <admin-add-variety-form />
            </div>
        </div>
    </div>
</template>

<script>
    import AdminUpdateVarietyInformationForm from '@/CustomComponents/Admin/AdminUpdateVarietyInformationForm'
    import AdminAddVarietyForm from '@/CustomComponents/Admin/AdminAddVarietyForm'

    export default {
        components: {
            AdminUpdateVarietyInformationForm,
            AdminAddVarietyForm,
        },
    }
</script>
