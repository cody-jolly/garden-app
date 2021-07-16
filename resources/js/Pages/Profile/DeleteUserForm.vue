<template>
    <jet-action-section>
        <template #title>
            Konto Löschen
        </template>

        <template #description>
            Ihren Konto dauerhaft löschen (kann nicht rückgängig gemacht werden).
        </template>

        <template #content>
            <div class="max-w-xl text-sm text-gray-600">
                Sobald Ihr Konto gelöscht wurde, werden alle Ressourcen und Daten dauerhaft von unsern Datenbank entfernt. Laden Sie vor dem Löschen Ihres Kontos alle Daten oder Informationen herunter, die Sie behalten möchten.
            </div>

            <div class="mt-5">
                <jet-danger-button @click.native="confirmUserDeletion">
                    Konto löschen
                </jet-danger-button>
            </div>

            <!-- Delete Account Confirmation Modal -->
            <jet-dialog-modal :show="confirmingUserDeletion" @close="closeModal">
                <template #title>
                    Konto löschen
                </template>

                <template #content>
                    Sind Sie sicher das Sie Ihr Konto wirklich löschen möchten? Sobald Ihr Konto gelöscht wurde, werden alle Ressourcen und Daten dauerhaft verloren. Bitte geben Sie Ihr Passwort ein, um zu bestätigen, dass Sie Ihr Konto unwiederkehrbar löschen möchten.
                    <div class="mt-4">
                        <jet-input type="password" class="mt-1 block w-3/4" placeholder="Passwort"
                                    ref="password"
                                    v-model="form.password"
                                    @keyup.enter.native="deleteUser" />

                        <jet-input-error :message="form.errors.password" class="mt-2" />
                    </div>
                </template>

                <template #footer>
                    <jet-secondary-button @click.native="closeModal">
                        Konto nicht löschen
                    </jet-secondary-button>

                    <jet-danger-button class="ml-2" @click.native="deleteUser" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                        Konto löschen
                    </jet-danger-button>
                </template>
            </jet-dialog-modal>
        </template>
    </jet-action-section>
</template>

<script>
    import JetActionSection from '@/Jetstream/ActionSection'
    import JetDialogModal from '@/Jetstream/DialogModal'
    import JetDangerButton from '@/Jetstream/DangerButton'
    import JetInput from '@/Jetstream/Input'
    import JetInputError from '@/Jetstream/InputError'
    import JetSecondaryButton from '@/Jetstream/SecondaryButton'

    export default {
        components: {
            JetActionSection,
            JetDangerButton,
            JetDialogModal,
            JetInput,
            JetInputError,
            JetSecondaryButton,
        },

        data() {
            return {
                confirmingUserDeletion: false,

                form: this.$inertia.form({
                    password: '',
                })
            }
        },

        methods: {
            confirmUserDeletion() {
                this.confirmingUserDeletion = true;

                setTimeout(() => this.$refs.password.focus(), 250)
            },

            deleteUser() {
                this.form.delete(route('current-user.destroy'), {
                    preserveScroll: true,
                    onSuccess: () => this.closeModal(),
                    onError: () => this.$refs.password.focus(),
                    onFinish: () => this.form.reset(),
                })
            },

            closeModal() {
                this.confirmingUserDeletion = false

                this.form.reset()
            },
        },
    }
</script>
