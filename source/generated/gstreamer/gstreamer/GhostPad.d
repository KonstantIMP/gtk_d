module gstreamer.GhostPad;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gstreamer.ObjectGst;
private import gstreamer.Pad;
private import gstreamer.PadTemplate;
private import gstreamer.ProxyPad;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * GhostPads are useful when organizing pipelines with #GstBin like elements.
 * The idea here is to create hierarchical element graphs. The bin element
 * contains a sub-graph. Now one would like to treat the bin-element like any
 * other #GstElement. This is where GhostPads come into play. A GhostPad acts as
 * a proxy for another pad. Thus the bin can have sink and source ghost-pads
 * that are associated with sink and source pads of the child elements.
 * 
 * If the target pad is known at creation time, gst_ghost_pad_new() is the
 * function to use to get a ghost-pad. Otherwise one can use gst_ghost_pad_new_no_target()
 * to create the ghost-pad and use gst_ghost_pad_set_target() to establish the
 * association later on.
 * 
 * Note that GhostPads add overhead to the data processing of a pipeline.
 */
public class GhostPad : ProxyPad
{
	/** the main Gtk struct */
	protected GstGhostPad* gstGhostPad;

	/** Get the main Gtk struct */
	public GstGhostPad* getGhostPadStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstGhostPad;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gstGhostPad;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstGhostPad* gstGhostPad, bool ownedRef = false)
	{
		this.gstGhostPad = gstGhostPad;
		super(cast(GstProxyPad*)gstGhostPad, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gst_ghost_pad_get_type();
	}

	/**
	 * Create a new ghostpad with @target as the target. The direction will be taken
	 * from the target pad. @target must be unlinked.
	 *
	 * Will ref the target.
	 *
	 * Params:
	 *     name = the name of the new pad, or %NULL to assign a default name
	 *     target = the pad to ghost.
	 *
	 * Returns: a new #GstPad, or %NULL in
	 *     case of an error.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name, Pad target)
	{
		auto __p = gst_ghost_pad_new(Str.toStringz(name), (target is null) ? null : target.getPadStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstGhostPad*) __p);
	}

	/**
	 * Create a new ghostpad with @target as the target. The direction will be taken
	 * from the target pad. The template used on the ghostpad will be @template.
	 *
	 * Will ref the target.
	 *
	 * Params:
	 *     name = the name of the new pad, or %NULL to assign a default name.
	 *     target = the pad to ghost.
	 *     templ = the #GstPadTemplate to use on the ghostpad.
	 *
	 * Returns: a new #GstPad, or %NULL in
	 *     case of an error.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name, Pad target, PadTemplate templ)
	{
		auto __p = gst_ghost_pad_new_from_template(Str.toStringz(name), (target is null) ? null : target.getPadStruct(), (templ is null) ? null : templ.getPadTemplateStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_template");
		}

		this(cast(GstGhostPad*) __p);
	}

	/**
	 * Create a new ghostpad without a target with the given direction.
	 * A target can be set on the ghostpad later with the
	 * gst_ghost_pad_set_target() function.
	 *
	 * The created ghostpad will not have a padtemplate.
	 *
	 * Params:
	 *     name = the name of the new pad, or %NULL to assign a default name.
	 *     dir = the direction of the ghostpad
	 *
	 * Returns: a new #GstPad, or %NULL in
	 *     case of an error.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name, GstPadDirection dir)
	{
		auto __p = gst_ghost_pad_new_no_target(Str.toStringz(name), dir);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_no_target");
		}

		this(cast(GstGhostPad*) __p);
	}

	/**
	 * Create a new ghostpad based on @templ, without setting a target. The
	 * direction will be taken from the @templ.
	 *
	 * Params:
	 *     name = the name of the new pad, or %NULL to assign a default name
	 *     templ = the #GstPadTemplate to create the ghostpad from.
	 *
	 * Returns: a new #GstPad, or %NULL in
	 *     case of an error.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name, PadTemplate templ)
	{
		auto __p = gst_ghost_pad_new_no_target_from_template(Str.toStringz(name), (templ is null) ? null : templ.getPadTemplateStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_no_target_from_template");
		}

		this(cast(GstGhostPad*) __p);
	}

	/**
	 * Invoke the default activate mode function of a ghost pad.
	 *
	 * Params:
	 *     pad = the #GstPad to activate or deactivate.
	 *     parent = the parent of @pad or %NULL
	 *     mode = the requested activation mode
	 *     active = whether the pad should be active or not.
	 *
	 * Returns: %TRUE if the operation was successful.
	 */
	public static bool activateModeDefault(Pad pad, ObjectGst parent, GstPadMode mode, bool active)
	{
		return gst_ghost_pad_activate_mode_default((pad is null) ? null : pad.getPadStruct(), (parent is null) ? null : parent.getObjectGstStruct(), mode, active) != 0;
	}

	/**
	 * Invoke the default activate mode function of a proxy pad that is
	 * owned by a ghost pad.
	 *
	 * Params:
	 *     pad = the #GstPad to activate or deactivate.
	 *     parent = the parent of @pad or %NULL
	 *     mode = the requested activation mode
	 *     active = whether the pad should be active or not.
	 *
	 * Returns: %TRUE if the operation was successful.
	 */
	public static bool internalActivateModeDefault(Pad pad, ObjectGst parent, GstPadMode mode, bool active)
	{
		return gst_ghost_pad_internal_activate_mode_default((pad is null) ? null : pad.getPadStruct(), (parent is null) ? null : parent.getObjectGstStruct(), mode, active) != 0;
	}

	/**
	 * Finish initialization of a newly allocated ghost pad.
	 *
	 * This function is most useful in language bindings and when subclassing
	 * #GstGhostPad; plugin and application developers normally will not call this
	 * function. Call this function directly after a call to g_object_new
	 * (GST_TYPE_GHOST_PAD, "direction", @dir, ..., NULL).
	 *
	 * Deprecated: This function is deprecated since 1.18 and does nothing
	 * anymore.
	 *
	 * Returns: %TRUE if the construction succeeds, %FALSE otherwise.
	 */
	public bool construct()
	{
		return gst_ghost_pad_construct(gstGhostPad) != 0;
	}

	/**
	 * Get the target pad of @gpad. Unref target pad after usage.
	 *
	 * Returns: the target #GstPad, can be
	 *     %NULL if the ghostpad has no target set. Unref target pad after
	 *     usage.
	 */
	public Pad getTarget()
	{
		auto __p = gst_ghost_pad_get_target(gstGhostPad);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Pad)(cast(GstPad*) __p, true);
	}

	/**
	 * Set the new target of the ghostpad @gpad. Any existing target
	 * is unlinked and links to the new target are established. if @newtarget is
	 * %NULL the target will be cleared.
	 *
	 * Params:
	 *     newtarget = the new pad target
	 *
	 * Returns: %TRUE if the new target could be set. This function
	 *     can return %FALSE when the internal pads could not be linked.
	 */
	public bool setTarget(Pad newtarget)
	{
		return gst_ghost_pad_set_target(gstGhostPad, (newtarget is null) ? null : newtarget.getPadStruct()) != 0;
	}
}
