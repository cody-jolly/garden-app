<template>
    <jet-form-section @submitted="addGarden">
        <template #title>
            Garten hinzufügen
        </template>

        <template #form>
            <div class="col-span-6 sm:col-span-4">
                <jet-label for="name" value="Garten Name" />
                <jet-input id="ame" type="text" class="mt-1 block w-full" v-model="form.name" ref="name" autocomplete="Garten Name" required/>
                <jet-input-error :message="form.errors.name" class="mt-2" />
            </div>
            <div class="col-span-6 sm:col-span-4">
                <jet-label for="servings" value="Personen zu versorgen" />
                <jet-input id="servings" type="text" class="mt-1 block w-full" v-model="form.servings" ref="servings" autocomplete="0" required/>
                <jet-input-error :message="form.errors.servings" class="mt-2" />
            </div>
        </template>

        <template #actions>
            <jet-action-message :on="form.recentlySuccessful" class="mr-3">
                Hinzugefügt.
            </jet-action-message>

            <jet-button :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                Hinzufügen
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
                    name: '',
                    servings: '',
                }),
            }
        },

        methods: {
            addGarden() {
                this.form.post(route('gardens.store'), {
                    errorBag: 'addGarden',
                    preserveScroll: true,
                    onSuccess: () => this.form.reset(),
                    onError: () => {
                        if (this.form.errors.name) {
                            this.form.reset()
                            this.$refs.name.focus()
                        }
                        if (this.form.errors.servings) {
                            this.form.reset()
                            this.$refs.name.focus()
                        }
                    }
                })
            },
        },
    }
</script>
