<template>

    <form @submit.prevent="deleteVariety">
        <jet-button class="text-red-600 hover:text-red-800 mx-3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
            Delete
        </jet-button>
    </form>

</template>

<script>
    import SecondaryButton from "@/Jetstream/SecondaryButton";
    import AdminUpdatePasswordForm from "@/CustomComponents/Admin/AdminUpdatePasswordForm";
    import JetActionMessage from "@/Jetstream/ActionMessage";
    import JetButton from "@/Jetstream/Button";
    import JetFormSection from "@/Jetstream/FormSection";

    export default {
        props: ['id', 'name'],

        components: {
            SecondaryButton,
            AdminUpdatePasswordForm,
            JetActionMessage,
            JetButton,
            JetFormSection,
        },

        data() {
            return {
                show: false,
                form: this.$inertia.form({
                    _method: 'DELETE',
                }),
            }
        },

        methods: {
            deleteVariety() {
                confirm('Are you sure you want to delete ' + this.name + '?') ?

                this.form.post(route('varieties.destroy', this.id), {
                    errorBag: 'deleteVariety',
                    preserveScroll: true,
                }) : console.log('deletion canceled')
            },
        },
    }
</script>



