module FormTailwindHelper
  def tw_form_with(**args, &block)
    args.merge!({ builder: TailwindFormBuilder, ref: 'form' })

    form_with(**args, &block)
  end
end
