<template>
    <jet-form-section @submitted="addBed()">
        <template #title>
            Gartenbeet hinzufügen
        </template>

        <template #form>
            <div class="col-span-6 sm:col-span-4">
                <jet-label for="length" value="Länge" />
                <jet-input id="length" type="text" class="mt-1 block w-full" v-model="form.length" ref="length" autocomplete="Länge" required/>
                <jet-input-error :message="form.errors.length" class="mt-2" />
            </div>
            <div class="col-span-6 sm:col-span-4">
                <jet-label for="width" value="Breite" />
                <jet-input id="width" type="text" class="mt-1 block w-full" v-model="form.width" ref="width" autocomplete="Breite" required/>
                <jet-input-error :message="form.errors.width" class="mt-2" />
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
        props: ['gardenId'],

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
                    length   : '',
                    width    : '',
                    garden_id : this.gardenId,
                }),
            }
        },

        methods: {
            addBed() {
                console.log(this.form)
                console.log(this.gardenId)
                this.form.post(route('beds.store'), {
                    preserveScroll: true,
                    onSuccess: () => this.form.reset(),
                })
            },
        },
    }
</script>
