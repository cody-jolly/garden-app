<template>
    <div>
        <h2 class="font-bold text-lg m-1">Users</h2>
        <div v-for="user in $page.props.users">
            <div class="m-3">
                <admin-update-profile-information-form :user="user" />
            </div>
        </div>
    </div>
</template>

<script>
    import AdminUpdateProfileInformationForm from '@/CustomComponents/Admin/AdminUpdateProfileInformationForm'
    import AdminUpdatePasswordForm from "@/CustomComponents/Admin/AdminUpdatePasswordForm";

    export default {
        components: {
            AdminUpdatePasswordForm,
            AdminUpdateProfileInformationForm,
        },
    }
</script>
