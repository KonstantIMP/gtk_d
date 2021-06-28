module gst.mpegts.CableDeliverySystemDescriptor;

private import glib.MemorySlice;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Cable Delivery System Descriptor (EN 300 468 v.1.13.1)
 */
public final class CableDeliverySystemDescriptor
{
	/** the main Gtk struct */
	protected GstMpegtsCableDeliverySystemDescriptor* gstMpegtsCableDeliverySystemDescriptor;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsCableDeliverySystemDescriptor* getCableDeliverySystemDescriptorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsCableDeliverySystemDescriptor;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsCableDeliverySystemDescriptor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsCableDeliverySystemDescriptor* gstMpegtsCableDeliverySystemDescriptor, bool ownedRef = false)
	{
		this.gstMpegtsCableDeliverySystemDescriptor = gstMpegtsCableDeliverySystemDescriptor;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			gst_mpegts_dvb_cable_delivery_system_descriptor_free(gstMpegtsCableDeliverySystemDescriptor);
	}


	/**
	 * the frequency in Hz (Hertz)
	 */
	public @property uint frequency()
	{
		return gstMpegtsCableDeliverySystemDescriptor.frequency;
	}

	/** Ditto */
	public @property void frequency(uint value)
	{
		gstMpegtsCableDeliverySystemDescriptor.frequency = value;
	}

	/**
	 * the outer FEC scheme used
	 */
	public @property GstMpegtsCableOuterFECScheme outerFec()
	{
		return gstMpegtsCableDeliverySystemDescriptor.outerFec;
	}

	/** Ditto */
	public @property void outerFec(GstMpegtsCableOuterFECScheme value)
	{
		gstMpegtsCableDeliverySystemDescriptor.outerFec = value;
	}

	/**
	 * Modulation scheme used
	 */
	public @property GstMpegtsModulationType modulation()
	{
		return gstMpegtsCableDeliverySystemDescriptor.modulation;
	}

	/** Ditto */
	public @property void modulation(GstMpegtsModulationType value)
	{
		gstMpegtsCableDeliverySystemDescriptor.modulation = value;
	}

	/**
	 * Symbol rate (in symbols per second)
	 */
	public @property uint symbolRate()
	{
		return gstMpegtsCableDeliverySystemDescriptor.symbolRate;
	}

	/** Ditto */
	public @property void symbolRate(uint value)
	{
		gstMpegtsCableDeliverySystemDescriptor.symbolRate = value;
	}

	/**
	 * inner FEC scheme used
	 */
	public @property GstMpegtsDVBCodeRate fecInner()
	{
		return gstMpegtsCableDeliverySystemDescriptor.fecInner;
	}

	/** Ditto */
	public @property void fecInner(GstMpegtsDVBCodeRate value)
	{
		gstMpegtsCableDeliverySystemDescriptor.fecInner = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_cable_delivery_system_descriptor_get_type();
	}

	/** */
	public void free()
	{
		gst_mpegts_dvb_cable_delivery_system_descriptor_free(gstMpegtsCableDeliverySystemDescriptor);
		ownedRef = false;
	}
}
