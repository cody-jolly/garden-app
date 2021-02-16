<template>
    <div>
        <div v-for="(user) in $page.props.users">
            <div>
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

        data () {
            return {
                show: {},
            }
        },

        mounted () {
            {
                this.$page.props.users.forEach((u,index) => this.show[index] = false)
            }
        },
    }
</script>
