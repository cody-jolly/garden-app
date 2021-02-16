<template>
    <jet-form-section @submitted="updatePassword">
        <template #title>
            Passwort verändern
        </template>

        <template #form>
            <div class="col-span-6 sm:col-span-4">
                <jet-label value="Passwort" />
                <jet-input type="password" class="mt-1 block w-full" v-model="form.current_password" ref="current_password" autocomplete="passwort" />
                <jet-input-error :message="form.errors.current_password" class="mt-2" />
            </div>

            <div class="col-span-6 sm:col-span-4">
                <jet-label value="Neues Passwort" />
                <jet-input type="password" class="mt-1 block w-full" v-model="form.password" ref="password" autocomplete="neues-passwort" />
                <jet-input-error :message="form.errors.password" class="mt-2" />
            </div>

            <div class="col-span-6 sm:col-span-4">
                <jet-label value="Neues Passwort wiederholen" />
                <jet-input type="password" class="mt-1 block w-full" v-model="form.password_confirmation" autocomplete="neues-passwort" />
                <jet-input-error :message="form.errors.password_confirmation" class="mt-2" />
            </div>
        </template>

        <template #actions>
            <jet-action-message :on="form.recentlySuccessful" class="mr-3">
                Gespeichert.
            </jet-action-message>

            <jet-button :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                Speichern
            </jet-button>
        </template>
    </jet-form-section>
</template>

<script>
    import JetActionMessage from '@/Jetstream/ActionMessage'
    import JetButton from '@/Jetstream/Button'
    import JetFormSection from '@/Jetstream/FormSection'
    import JetInput from '@/Jetstream/Input'
    import JetInputError from '@/Jetstream/InputError'
    import JetLabel from '@/Jetstream/Label'

    export default {
        props: ['user'],

        components: {
            JetActionMessage,
            JetButton,
            JetFormSection,
            JetInput,
            JetInputError,
            JetLabel,
        },

        data() {
            return {
                form: this.$inertia.form({
                    current_password: '',
                    password: '',
                    password_confirmation: '',
                    userId: this.user.id,
                }),
            }
        },

        methods: {
            updatePassword() {
                this.form.put(route('admin.update-user-password'), {
                    errorBag: 'updatePassword',
                    preserveScroll: true,
                    onSuccess: () => this.form.reset(),
                    onError: () => {
                        if (this.form.errors.password) {
                            this.form.reset('password', 'password_confirmation')
                            this.$refs.password.focus()
                        }

                        if (this.form.errors.current_password) {
                            this.form.reset('current_password')
                            this.$refs.current_password.focus()
                        }
                    }
                })
            },
        },
    }
</script>
