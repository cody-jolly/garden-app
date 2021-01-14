<template>
    <div>
        <ul>
            <li v-for="garden in gardens" :key="garden.id">
                <div class="m-4 p-2 border relative">
                    <jet-form-section @submitted="updateGarden(garden.id)">
                        <template #title>{{ garden.name }}</template>
                        <template #form>
                            <div class="col-span-7 sm:col-span-4">
                                <jet-label for="garden_name" value="Name Bearbeiten" />
                                <jet-input id="garden_name" type="text" class="mt-1 block w-full" v-model="form.garden_name" ref="garden_name" autocomplete="Garten Name" required/>
                                <jet-input-error :message="form.errors.garden_name" class="mt-2" />
                            </div>
                        </template>

                        <template #actions>
                            <jet-action-message :on="form.recentlySuccessful" class="mr-1">
                                Gespeichert.
                            </jet-action-message>
                            <jet-button :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                                Speichern
                            </jet-button>
                            <inertia-link class="inline-flex items-center ml-2 px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:text-gray-800 active:bg-gray-50 transition ease-in-out duration-150"
                                          method="delete" as="button" :href.prevent="route('gardens.destroy', garden.id)">Löschen</inertia-link>
                        </template>
                    </jet-form-section>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
    import JetActionMessage from '@/Jetstream/ActionMessage'
    import JetButton from '@/Jetstream/Button'
    import JetSecondaryButton from '@/Jetstream/SecondaryButton'
    import JetFormSection from '@/Jetstream/FormSection'
    import JetInput from '@/Jetstream/Input'
    import JetInputError from '@/Jetstream/InputError'
    import JetLabel from '@/Jetstream/Label'

    export default {
        components: {
            JetActionMessage,
            JetButton,
            JetSecondaryButton,
            JetFormSection,
            JetInput,
            JetInputError,
            JetLabel,
        },

        computed: {
            gardens: function () {
                return this.$page.props.gardens
            }
        },

        data() {
            return {
                form: this.$inertia.form({
                    garden_name: '',
                }),
            }
        },

        methods: {
            updateGarden(gardenId) {
                this.form.put(route('gardens.update', gardenId), {
                    errorBag: 'addGarden',
                    preserveScroll: true,
                    onSuccess: () => this.form.reset(),
                    onError: () => {
                        if (this.form.errors.garden_name) {
                            this.form.reset('garden_name')
                            this.$refs.garden_name.focus()
                        }
                    }
                })
            },
        },
    }
</script>
