<!--TODO finish GardenOverview-->
<template>
    <div>
        <div class="p-6 sm:px-20 bg-white border-b border-gray-200">
<!--            <div class="mt-8 text-base">-->
<!--                {{ $page.props }}-->
<!--            </div>-->
            <jet-form-section v-if="$page.props.user" @submitted="addGarden">
                <template #title>
                    Garten hinzufügen
                </template>

                <template #form>
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label for="garden_name" value="Garten Name" />
                        <jet-input id="garden_name" type="text" class="mt-1 block w-full" v-model="form.garden_name" ref="garden_name" autocomplete="Garten Name" required/>
                        <jet-input-error :message="form.errors.garden_name" class="mt-2" />
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
            <div v-else>
                Bitte melden Sie sich an, um diesen Bereich zu sehen.
            </div>
        </div>
    </div>
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
                    garden_name: '',
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

