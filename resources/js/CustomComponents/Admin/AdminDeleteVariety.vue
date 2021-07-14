<!--TODO: finish this-->
<template>

    <jet-form-section @submitted="deleteVariety">
        <template #actions>
            <jet-button :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                Delete
            </jet-button>
        </template>
    </jet-form-section>

</template>

<script>
    import SecondaryButton from "@/Jetstream/SecondaryButton";
    import AdminUpdatePasswordForm from "@/CustomComponents/Admin/AdminUpdatePasswordForm";
    import JetActionMessage from "@/Jetstream/ActionMessage";
    import JetButton from "@/Jetstream/Button";
    import JetFormSection from "@/Jetstream/FormSection";

    export default {
        props: ['id'],

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
                console.log(this.form)

                this.form.post(route('varieties.destroy', this.id), {
                    errorBag: 'deleteVariety',
                    preserveScroll: true,
                });
            },
        },
    }
</script>



