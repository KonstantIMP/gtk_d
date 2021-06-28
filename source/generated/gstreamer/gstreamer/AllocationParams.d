module gstreamer.AllocationParams;

private import gobject.ObjectG;
private import gstreamer.c.functions;
public  import gstreamer.c.types;
private import linker.loader;


/**
 * Parameters to control the allocation of memory
 */
public class AllocationParams
{
	/** the main Gtk struct */
	protected GstAllocationParams* gstAllocationParams;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstAllocationParams* getAllocationParamsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstAllocationParams;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstAllocationParams;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstAllocationParams* gstAllocationParams, bool ownedRef = false)
	{
		this.gstAllocationParams = gstAllocationParams;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTREAMER[0]) && ownedRef )
			gst_allocation_params_free(gstAllocationParams);
	}


	/** */
	public static GType getType()
	{
		return gst_allocation_params_get_type();
	}

	/**
	 * Create a copy of @params.
	 *
	 * Free-function: gst_allocation_params_free
	 *
	 * Returns: a new ##GstAllocationParams, free with
	 *     gst_allocation_params_free().
	 */
	public AllocationParams copy()
	{
		auto __p = gst_allocation_params_copy(gstAllocationParams);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(AllocationParams)(cast(GstAllocationParams*) __p, true);
	}

	/**
	 * Free @params
	 */
	public void free()
	{
		gst_allocation_params_free(gstAllocationParams);
		ownedRef = false;
	}

	/**
	 * Initialize @params to its default values
	 */
	public void init()
	{
		gst_allocation_params_init(gstAllocationParams);
	}
}
