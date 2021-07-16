<template>
    <div>
        <button @click="show = !show" class="font-semibold text-lg">{{ variety.id }}. {{ variety.variety_name }}</button>
        <div v-show="show">

            <jet-form-section @submitted="updateVarietyInformation">
                <template #title>
                    Variety Information
                </template>

                <template #form>
                    <!-- Name -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="Name" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.name" autocomplete="name" />
                        <jet-input-error :message="form.errors.name" class="mt-2" />
                    </div>

                    <!-- Weeks to Maturity -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="Weeks to Maturity" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.weeksToMaturity" autocomplete="0" />
                        <jet-input-error :message="form.errors.weeksToMaturity" class="mt-2" />
                    </div>

                    <!-- Servings per m2 -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="Servings per m2" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.servingsPerM2" autocomplete="0" />
                        <jet-input-error :message="form.errors.servingsPerM2" class="mt-2" />
                    </div>

                    <!-- Max Low Temp -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="Max Low Temp" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.maxLowTemp" autocomplete="0" />
                        <jet-input-error :message="form.errors.maxLowTemp" class="mt-2" />
                    </div>

                    <!-- First Sowing -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="First Sowing Week" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.firstSowing" autocomplete="0" />
                        <jet-input-error :message="form.errors.firstSowing" class="mt-2" />
                    </div>

                    <!-- Last Sowing -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="Last Sowing Week" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.lastSowing" autocomplete="0" />
                        <jet-input-error :message="form.errors.lastSowing" class="mt-2" />
                    </div>

                    <!-- Harvets Window -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="Harvest Window (weeks)" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.harvestWindow" autocomplete="0" />
                        <jet-input-error :message="form.errors.harvestWindow" class="mt-2" />
                    </div>

                    <!-- Multiple Sowings -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="Mulitple Sowings" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.multipleSowings" autocomplete="0" />
                        <jet-input-error :message="form.errors.multipleSowings" class="mt-2" />
                    </div>

                    <!-- First Harvest -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="First Harvest Week" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.firstHarvest" autocomplete="0" />
                        <jet-input-error :message="form.errors.firstHarvest" class="mt-2" />
                    </div>

                    <!-- Last Harvest -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="Last Harvest Week" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.lastHarvest" autocomplete="0" />
                        <jet-input-error :message="form.errors.lastHarvest" class="mt-2" />
                    </div>

                    <!-- Total Harvests -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="Total Harvests" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.totalHarvests" autocomplete="0" />
                        <jet-input-error :message="form.errors.totalHarvests" class="mt-2" />
                    </div>

                    <!-- Total Sowings -->
                    <div class="col-span-6 sm:col-span-4">
                        <jet-label value="Total Sowings" />
                        <jet-input type="text" class="mt-1 block w-full" v-model="form.totalSowings" autocomplete="0" />
                        <jet-input-error :message="form.errors.totalSowings" class="mt-2" />
                    </div>
                </template>

                <template #actions>
                    <jet-action-message :on="form.recentlySuccessful" class="mr-3">
                        Gespeichert.
                    </jet-action-message>

                    <jet-button :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                        Speichern
                    </jet-button>
                    <admin-delete-variety :id="variety.id" :name="variety.variety_name" />
                </template>
            </jet-form-section>
        </div>
    </div>
</template>

<script>
    import SecondaryButton from "@/Jetstream/SecondaryButton";
    import AdminUpdatePasswordForm from "@/CustomComponents/Admin/AdminUpdatePasswordForm";
    import JetActionMessage from "@/Jetstream/ActionMessage";
    import JetButton from "@/Jetstream/Button";
    import JetFormSection from "@/Jetstream/FormSection";
    import JetInput from "@/Jetstream/Input";
    import JetInputError from "@/Jetstream/InputError";
    import JetLabel from "@/Jetstream/Label";
    import JetSecondaryButton from "@/Jetstream/SecondaryButton";
    import AdminDeleteVariety from '@/CustomComponents/Admin/AdminDeleteVariety'

    export default {
        props: ['variety'],

        components: {
            SecondaryButton,
            AdminUpdatePasswordForm,
            JetActionMessage,
            JetButton,
            JetFormSection,
            JetInput,
            JetInputError,
            JetLabel,
            JetSecondaryButton,
            AdminDeleteVariety,
        },

        data() {
            return {
                show: false,
                form: this.$inertia.form({
                    _method: 'PUT',
                    name: this.variety.variety_name,
                    weeksToMaturity: this.variety.weeks_to_maturity,
                    servingsPerM2: this.variety.servings_per_m2,
                    maxLowTemp: this.variety.max_low_temp,
                    firstSowing: this.variety.first_sowing,
                    lastSowing: this.variety.last_sowing,
                    harvestWindow: this.variety.harvest_window,
                    multipleSowings: this.variety.multiple_sowings,
                    firstHarvest: this.variety.first_harvest,
                    lastHarvest: this.variety.last_harvest,
                    totalHarvests: this.variety.total_harvests,
                    totalSowings: this.variety.total_sowings,
                }),
            }
        },

        methods: {
            updateVarietyInformation() {
                console.log(this.form)

                this.form.post(route('varieties.update', this.variety.id), {
                    errorBag: 'updateVarietyInformation',
                    preserveScroll: true,
                });
            },
        },
    }
</script>
