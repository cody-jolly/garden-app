<template>
    <div>
        <div v-for="(user) in $page.props.users">
            <div>
                <admin-update-profile-information-form :user="user" />
            </div>
            <!--        TODO show update password and delete user    -->
<!--                <div>-->
<!--                    <update-password-form class="mt-10 sm:mt-0" />-->
<!--                </div>-->
        </div>
    </div>
</template>

<script>
    import UpdatePasswordForm from '@/Pages/Profile/UpdatePasswordForm'
    import AdminUpdateProfileInformationForm from '@/CustomComponents/Admin/AdminUpdateProfileInformationForm'

    export default {
        components: {
            UpdatePasswordForm,
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
