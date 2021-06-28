module gst.mpegts.DVBServiceListItem;

private import glib.MemorySlice;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class DVBServiceListItem
{
	/** the main Gtk struct */
	protected GstMpegtsDVBServiceListItem* gstMpegtsDVBServiceListItem;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDVBServiceListItem* getDVBServiceListItemStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDVBServiceListItem;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDVBServiceListItem;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDVBServiceListItem* gstMpegtsDVBServiceListItem, bool ownedRef = false)
	{
		this.gstMpegtsDVBServiceListItem = gstMpegtsDVBServiceListItem;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsDVBServiceListItem);
	}


	/**
	 * the id of a service
	 */
	public @property ushort serviceId()
	{
		return gstMpegtsDVBServiceListItem.serviceId;
	}

	/** Ditto */
	public @property void serviceId(ushort value)
	{
		gstMpegtsDVBServiceListItem.serviceId = value;
	}

	/**
	 * the type of a service
	 */
	public @property GstMpegtsDVBServiceType type()
	{
		return gstMpegtsDVBServiceListItem.type;
	}

	/** Ditto */
	public @property void type(GstMpegtsDVBServiceType value)
	{
		gstMpegtsDVBServiceListItem.type = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_service_list_item_get_type();
	}
}
